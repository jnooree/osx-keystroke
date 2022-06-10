add_executable(keystroke keystroke.m)
target_link_libraries(keystroke
  "-framework Foundation"
  "-framework CoreGraphics")

install(TARGETS keystroke RUNTIME)
