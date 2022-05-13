import
  options

type
  ConfigurationError* = object of CatchableError

  TypedInputFile*[ContentType = Unspecified,
                  Format = Unspecified,
                  defaultExt: static string] = distinct string

  # InputFile* = TypedInputFile[Unspecified, Unspecified, ""]
  # TODO temporary work-around, see parseCmdArg
  InputFile* = distinct string

  InputDir* = distinct string
  OutPath* = distinct string
  OutDir* = distinct string
  OutFile* = distinct string

  Flag* = object
    name*: TaintedString

  FlagWithValue* = object
    name*: TaintedString
    value*: TaintedString

  FlagWithOptionalValue* = object
    name*: TaintedString
    value*: Option[TaintedString]

  Unspecified* = object
  Txt* = object

  SomeDistinctString = InputFile|InputDir|OutPath|OutDir|OutFile

template `/`*(dir: InputDir|OutDir, path: string): auto =
  string(dir) / path

template `$`*(x: SomeDistinctString): string =
  string(x)

template desc*(v: string) {.pragma.}
template longDesc*(v: string) {.pragma.}
template name*(v: string) {.pragma.}
template abbr*(v: string) {.pragma.}
template defaultValue*(v: untyped) {.pragma.}
template defaultValueDesc*(v: string) {.pragma.}
template separator*(v: string) {.pragma.}
template required* {.pragma.}
template command* {.pragma.}
template argument* {.pragma.}
template arguments* {.pragma.}
template hidden* {.pragma.}
template ignore* {.pragma.}
template inlineConfiguration* {.pragma.}
template forwardedCmdArgs*(separator: string = "--")* {.pragma.}
template implicitlySelectable* {.pragma.}
  ## This can be applied to a case object discriminator
  ## to allow the value of the discriminator to be determined
  ## implicitly when the user specifies any of the sub-options
  ## that depend on the disciminator value.

