import subprocess
from ranger.api.commands import *
class fasd(Command):
    """
    :fasd

    Jump to directory using fasd
    """
    def execute(self):
        arg = self.rest(1)
        if arg:
            directory = subprocess.check_output(["fasd", "-d"]+arg.split(), universal_newlines=True).strip()
            self.fm.cd(directory)