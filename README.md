# relative-n.vim 
Display the nth relative number in the signs bar

# What ? 
This script display the 10nth lines before and after the current cursor row
position. It comes from a [this question](http://vi.stackexchange.com/questions/4288/show-only-every-n-relative-line-number).

The core concept behind it comes directly from the
[vim-signature](https://github.com/kshenoy/vim-signature) plugin. Here is
a step-by-step walkthrough : 

1. Remove all previous signs from the sign bar
2. Build a list of the lines you want to show in the sign bar
3. For each line, create a new sign with a unique id (based on current buffer
   and line number)
4. For each line, display the sign (the text of the sign will be the current
   line) 

# Warnings 
This script works as a proof of concept, but I wouldn't use is. You will see
if you try it that it gets all flickering when you move quickly. I think the
reason behind it is that the sign bar is not intended to quickly change over
time.

# Contribution
If you want to see this code evolve and maybe become a plugin, you can reach
via an issue. Thanks !
