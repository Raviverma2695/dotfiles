##
# Plugins
#

# Add the plugins you want to use here.
# For more info on each plugin, visit its repo at github.com/<plugin>
# -a sets the variable's type to array.
local -a plugins=(
	zsh-users/zsh-autosuggestions     # Inline suggestions
	zsh-users/zsh-syntax-highlighting # Command-line syntax highlighting
	marlonrichert/zsh-autocomplete    # Real-time type-ahead completion
	marlonrichert/zsh-edit            # Better keyboard shortcuts
	marlonrichert/zcolors             # Colors for completions and Git
	qoomon/zsh-lazyload               # Load scripts on demand
)

# The Zsh Autocomplete plugin sends *a lot* of characters to your terminal.
# This is fine locally on modern machines, but if you're working through a slow
# ssh connection, you might want to add a slight delay before the
# autocompletion kicks in:
# Increase the delay before suggestions appear to make autocomplete less aggressive.
zstyle ':autocomplete:*' min-delay 3  # Adjust the delay as needed

# Disable automatic suggestions, requiring a specific key (e.g., Tab) to show completions.
zstyle ':autocomplete:*' insert-unambiguous no
zstyle ':autocomplete:*' insert-tab no

# Limit the number of suggestions displayed to reduce clutter.
zstyle ':autocomplete:*' max-lines 10%  # Adjust based on preference

#
# If your connection is VERY slow, then you might want to disable
# autocompletion completely and use only tab completion instead:
#   zstyle ':autocomplete:*' async no

# Speed up the first startup by cloning all plugins in parallel.
# This won't clone plugins that we already have.
znap clone $plugins

# Load each plugin, one at a time.
local p=
for p in $plugins; do
	znap source $p
done

# `znap eval <name> '<command>'` is like `eval "$( <command> )"` but with
# caching and compilation of <command>'s output, making it ~10 times faster.
znap eval zcolors "zcolors ${(q)LS_COLORS}" # Extra init code needed for zcolors.
