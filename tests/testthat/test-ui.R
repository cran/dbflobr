test_that("ui functions work", {
  expect_is(capture.output(ui_value("hi")), "character")
  expect_is(capture.output(ui_oops("hi")), "character")
  expect_is(capture.output(ui_done("hi")), "character")
  expect_is(capture.output(ui_line("hi")), "character")
})
