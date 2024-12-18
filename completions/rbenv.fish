# Copyright (c) 2013 Sam Stephenson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function __fish_rbenv_needs_command
  set cmd (commandline --tokenize --current-process --cut-at-cursor)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'rbenv' ]
    return 0
  end
  return 1
end

function __fish_rbenv_using_command
  set cmd (commandline --tokenize --current-process --cut-at-cursor)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete --no-files --command rbenv --condition '__fish_rbenv_needs_command' --arguments '(rbenv commands)'
for cmd in (rbenv commands)
  complete --no-files --command rbenv --condition "__fish_rbenv_using_command $cmd" --arguments \
    "(rbenv completions (commandline --tokenize --current-process --cut-at-cursor)[2..-1])"
end
