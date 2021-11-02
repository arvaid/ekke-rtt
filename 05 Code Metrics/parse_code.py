import os.path
import radon.raw
from radon.complexity import cc_rank
from radon.metrics import mi_parameters, mi_compute
from staticfg import CFGBuilder

# https://radon.readthedocs.io/en/latest/api.html
# https://radon.readthedocs.io/en/latest/intro.html#halstead-metrics

class Analyzer:
    def __init__(self, filepath):
        self.filepath = filepath
        self.src = ""
        self.stats = {}

    def _read_source(self):
        with open(self.filepath, 'r') as source_file:
            self.src = source_file.read()

    def analyze(self):
        if self.src == "":
            self._read_source()

        raw = radon.raw.analyze(self.src)
        self.stats.update({'loc': raw.loc})
        self.stats.update({'lloc': raw.lloc})
        self.stats.update({'sloc': raw.sloc})
        self.stats.update({'comments': raw.comments})
        self.stats.update({'comments_single': raw.single_comments})
        self.stats.update({'comments_multi': raw.multi})
        self.stats.update({'blank': raw.blank})

        mi_params = mi_parameters(self.src)
        h = mi_params[0]
        cc = mi_params[1]
        mi = mi_compute(halstead_volume=h, complexity=cc, sloc=mi_params[2], comments=mi_params[3])
        self.stats.update({'cc': cc})
        self.stats.update({'cc_rank': cc_rank(cc)})
        self.stats.update({'h': h})
        self.stats.update({'mi': mi})

    def report(self):
        print(f'Parsed "{self.filepath}"')
        print(f'CC: {self.stats["cc"]} (rank {self.stats["cc_rank"]})')
        print(f'Halstead Volume: {self.stats["h"]:.2f}')
        print(f'Maintainability Index: {self.stats["mi"]:.2f}')
        print(f'LOC: {self.stats["loc"]} LLOC: {self.stats["lloc"]} SLOC: {self.stats["sloc"]}')
        print(f'Comments: {self.stats["comments"]} Single: {self.stats["comments_single"]} '
              f'Multiline: {self.stats["comments_multi"]}')
        print(f'Blank lines: {self.stats["blank"]}')

    def build_cgf(self):
        basename = os.path.basename(self.filepath)
        cfg = CFGBuilder().build_from_src(basename, self.src)
        cfg.build_visual('test', 'png')


if __name__ == '__main__':
    a = Analyzer('test.py')
    a.analyze()
    a.report()
    a.build_cgf()
