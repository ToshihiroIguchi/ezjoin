
ezjoin <- function(x, y, by = NULL, method){
  
  if(method == "Mutating Joins(Left Join)"){
    return(left_join(x, y, by = by))
  }
  if(method == "Mutating Joins(Right Join)"){
    return(right_join(x, y, by = by))
  }
  if(method == "Mutating Joins(Inner Join)"){
    return(inner_join(x, y, by = by))
  }
  if(method == "Mutating Joins(Full Join)"){
    return(full_join(x, y, by = by))
  }
  if(method == "Filtering Joins(Semi Join)"){
    return(semi_join(x, y, by = by))
  }
  if(method == "Filtering Joins(Anti Join)"){
    return(anti_join(x, y, by = by))
  }
  if(method == "Set Operations(Intersect)"){
    return(intersect(x, y))
  }
  if(method == "Set Operations(Union)"){
    return(union(x, y))
  }
  if(method == "Set Operations(Setdiff)"){
    return(setdiff)(x, y)
  }
  if(method == "Binding(Bind Rows)"){
    return(bind_rows(x, y))
  }
  if(method == "Binding(Bind Cols)"){
    return(bind_cols(x, y))
  }

}

sel.method <- function(method1){
  if(method1 == "Mutating Joins"){
    return(c("Left Join", "Right Join", "Inner Join", "Full Join"))
  }
  if(method1 == "Filtering Joins"){
    return(c("Semi Join", "Anti Join"))
  }
  if(method1 == "Set Operations"){
    return(c("Intersect", "Union", "Setdiff"))
  }
  if(method1 == "Binding"){
    return(c("Bind Rows", "Bind Cols"))
  }
}

method.bond <- function(method1, method2){
  ret <- paste0(method1, "(", method2, ")")
  return(ret)
}

get.by <- function(x, y){intersect(names(x), names(y))}

read.csv.sp <- function(file){
  ret <- read.csv(file, stringsAsFactors = F, fileEncoding = "UTF-8-BOM")
  return(ret)
}

method.sel <- function(data1, data2){
  dl <- length(intersect(names(data1), names(data2)))
  if(dl == length(names(data1))){
    ret <- c("Mutating Joins",
             "Filtering Joins",
             "Set Operations",
             "Binding")
  }else{
    ret <- c("Mutating Joins",
             "Filtering Joins")
  }
  return(ret)
}



