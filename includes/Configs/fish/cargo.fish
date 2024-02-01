# #!/bin/sh
# # rustup shell setup
# # affix colons on either side of $PATH to simplify matching
# case ":${PATH}:" in
#     *:"$HOME/.cargo/bin":*)
#         ;;
#     *)
#         # Prepending path in case a system-installed rustc needs to be overridden
#         export PATH="$HOME/.cargo/bin:$PATH"
#         ;;
# esac

switch "$PATH"
  case "*$HOME/.cargo/bin*"
      # echo '$PATH already contains $HOME/.cargo/bin'
  case '*'
    set --global PATH $HOME/.cargo/bin $PATH
end
