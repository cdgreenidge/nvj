import pynvim


@pynvim.plugin
class NVJ(object):
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command("TestCommand", nargs="*", range="")
    def testcommand(self, args, range):
        self.nvim.current.line = "Command with args: {}, range: {}".format(args, range)
