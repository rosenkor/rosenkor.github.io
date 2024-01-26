ENTRY
  { address author booktitle chapter edition editor howpublished
    institution journal key month note number organization pages
    publisher school series title type volume year }
  {}
  { label extra.label sort.label short.list }

INTEGERS { nameptr }

FUNCTION {bold}
{ duplicate$ empty$
    { pop$ "" }
    { "{\\bf " swap$ * "}" * }
  if$
}

FUNCTION {format.title}
{ title bold }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  ""
  { s num.names$ duplicate$ nameptr >
      { pop$ "" }
      { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't :=
        nameptr #1 >
          { ", " * t * }
          { t }
        if$
        nameptr #1 + 'nameptr :=
      }
    if$
  }
  while$
}

FUNCTION {format.authors}
{ author format.names }

FUNCTION {format.year}
{ year empty$
    { "" }
    { " (" year * ")" * }
  if$
}

FUNCTION {format.note}
{ note empty$
    { "" }
    { note }
  if$
}

FUNCTION {format.entry}
{ format.authors
  format.title
  format.year
  format.note
  tie.or.space.connect
}

READ
EXECUTE {sort}
ITERATE {call.type$}
