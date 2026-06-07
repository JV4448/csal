test_that("DM rows generated", {

  dm <- create_dm_raw(100)

  expect_equal(
    nrow(dm),
    100
  )

})
