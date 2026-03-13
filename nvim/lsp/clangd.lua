return {
  -- cmd = { 'clangd', '--background-index', "--query-driver=/Applications/ArmGNUToolchain/14.2.rel1/arm-none-eabi/bin/arm-none-eabi-g*", "--query-driver=/Users/z/.platformio/packages/toolchain-xtensa-esp32/bin/*gcc" },

  cmd = { 'clangd', '--background-index', "--query-driver=/Users/z/.platformio/packages/toolchain-xtensa-esp32/bin/*" },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp' },
}


