# R/create_raw_data.R

#' Create Mock Demographics
#'
#' @export

create_dm_raw <- function(n = 100){

  data.frame(
    SUBJID = sprintf("SUBJ%03d",1:n),
    SEX = sample(c("M","F"),n,replace = TRUE),
    AGE = sample(18:80,n,replace = TRUE),
    ARM = sample(
      c("Placebo","Drug A"),
      n,
      replace = TRUE
    )
  )

}


#' Create Mock Vital Signs
#'
#' @export

create_vs_raw <- function(n = 100){

  expand.grid(
    SUBJID = sprintf("SUBJ%03d",1:n),
    VISIT = c(
      "SCREENING",
      "BASELINE",
      "WEEK 4",
      "WEEK 8"
    )
  ) |>
    dplyr::mutate(
      SYSBP = round(rnorm(
        dplyr::n(),
        120,
        15
      )),
      DIABP = round(rnorm(
        dplyr::n(),
        80,
        10
      ))
    )

}


#' Create Mock Laboratory Data
#'
#' @export

create_lb_raw <- function(n = 100){

  expand.grid(
    SUBJID = sprintf("SUBJ%03d",1:n),
    PARAM = c(
      "ALT",
      "AST",
      "BILI"
    )
  ) |>
    dplyr::mutate(
      AVAL = round(
        runif(
          dplyr::n(),
          10,
          150
        ),
        1
      )
    )

}


