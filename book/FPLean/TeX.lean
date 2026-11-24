module

public import SubVerso.Highlighting
public import VersoManual

namespace FPLean.TeX

open SubVerso.Highlighting

public partial def highlightedSource : Highlighted → String
  | .token token => token.content
  | .text text | .unparsed text => text
  | .seq parts => String.join (parts.toList.map highlightedSource)
  | .span _ content | .tactics _ _ _ content => highlightedSource content
  | .point _ _ => ""

public def mintedListing (lexer source : String) : Verso.Output.TeX :=
  .raw s!"\\begin\{minted}[breaklines,fontsize=\\small]\{{lexer}}\n{source}\n\\end\{minted}"

public def mintedPackages : List String :=
  ["\\usepackage{minted}"]

end FPLean.TeX
