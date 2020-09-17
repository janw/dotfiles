c.InteractiveShellApp.extensions = ["autoreload"]
c.InteractiveShellApp.exec_lines = ["%autoreload 2"]
c.InteractiveShellApp.exec_lines.append(
    'print("# autoreload enabled")'
)
c.TerminalIPythonApp.display_banner = False
