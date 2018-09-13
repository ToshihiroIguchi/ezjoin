
ezjoin <- function(x, y, by = NULL, method){
  
  if(method == "Mutating Joins(left join)"){
    return(left_join(x, y, by = by))
  }
  if(method == "Mutating Joins(right join)"){
    return(right_join(x, y, by = by))
  }
  if(method == "Mutating Joins(inner join)"){
    return(inner_join(x, y, by = by))
  }
  if(method == "Mutating Joins(full join)"){
    return(full_join(x, y, by = by))
  }
  if(method == "Filtering Joins(semi join)"){
    return(semi_join(x, y, by = by))
  }
  if(method == "Filtering Joins(anti join)"){
    return(anti_join(x, y, by = by))
  }
  if(method == "Set Operations(intersect)"){
    return(intersect(x, y))
  }
  if(method == "Set Operations(union)"){
    return(union(x, y))
  }
  if(method == "Set Operations(setdiff)"){
    return(setdiff)(x, y)
  }
  if(method == "Binding(bind rows)"){
    return(bind_rows(x, y))
  }
  if(method == "Binding(bind cols)"){
    return(bind_cols(x, y))
  }

}





get.by <- function(x, y){intersect(names(x), names(y))}

read.csv.sp <- function(file){
  ret <- read.csv(file, stringsAsFactors = F, fileEncoding = "UTF-8-BOM")
  return(ret)
}



