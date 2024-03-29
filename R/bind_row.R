#' Bind data by rows
#'
#' This function takes a list of data frames or data tables and combines them by rows,
#' it adds the rows of the second data below the rows of the first one.
#'
#' @param \dots A list of data frames or data tables to be combined by rows.
#' @param showOverview Default \code{TRUE} displays the dimension and column names of the combined data.
#' @return An object of the same type as the first input. The object will contain a column if that column
#'         appears in any of the inputs.
#' @note A common attribute is not necessary (difference to the function \code{\link{rtry_join_left}} and \code{\link{rtry_join_outer}}):
#'       the binding process simply puts the data one after another while matching the column names, and any missing columns will be
#'       filled with \code{NA}.
#' @references This function makes use of the \code{\link[dplyr]{bind_rows}} function within the \code{dplyr} package.
#' @seealso \code{\link{rtry_bind_col}}, \code{\link{rtry_join_left}}, \code{\link{rtry_join_outer}}
#' @examples
#' # Combine the two provided sample data (data_TRY_15160 and data_TRY_15161)
#' data <- rtry_bind_row(data_TRY_15160, data_TRY_15161)
#'
#' # Expected message:
#' # dim:   6409 28
#' # col:   LastName FirstName DatasetID Dataset SpeciesName AccSpeciesID AccSpeciesName
#' #        ObservationID ObsDataID TraitID TraitName DataID DataName OriglName
#' #        OrigValueStr OrigUnitStr ValueKindName OrigUncertaintyStr UncertaintyName
#' #        Replicates StdValue UnitName RelUncertaintyPercent OrigObsDataID ErrorRisk
#' #        Reference Comment V28
#' @export
rtry_bind_row <- function(..., showOverview = TRUE){
  # If ... is missing, show the message
  if(missing(...)){
    message("Please specify at least two data frames to be combined by rows")
  }
  else{
    # Perform row binding
    TRYdata <- dplyr::bind_rows(...)

    # If the combined data is not NULL and if the argument showOverview is set to be TRUE
    # Print the dimension and column names of the combined data
    if(length(TRYdata) != 0 && showOverview == TRUE){
      message("dim:   ", paste0(dim(TRYdata), sep = " "))
      message("col:   ", paste0(colnames(TRYdata), sep = " "))
    }

    # Return the combined data
    return(TRYdata)
  }
}
