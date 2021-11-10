\paper {
  % change for other default global staff size.
  myStaffSize = #20
  %{
     run
         lilypond -dshow-available-fonts
     to show all fonts available in the process log.
  %}

  #(define fonts
    (make-pango-font-tree "Times New Roman"
                          "Nimbus Sans,Nimbus Sans L"
                          "Luxi Mono"

     (/ myStaffSize 20)))
}
\header {
  title = "Song Name here"
  composer = "by Kawing Chan"
  meter = "moderato"
  tagline = \markup {
      \center-column {
        "Copyright © 2021 Kawing Chan"
        "Please respect Kawing's copyright and do not share, trade or distribute this PDF file on the Internet."
        "Doing so is against the artist's wishes and is a copyright violation. Thank you."
    }
  }
}

upper = \relative c'' {
  \clef treble
  \key c \major
  \numericTimeSignature
  \time 4/4
  a4 b c d
}

lower = \relative c {
  \clef bass
  \key c \major
  \numericTimeSignature
  \time 4/4
  a2 c
}

\score {
  \new PianoStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
\layout {
    short-indent = 2\cm
    indent = 3\cm
}
  \midi { }
}