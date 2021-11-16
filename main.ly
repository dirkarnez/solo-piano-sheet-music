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

\version "2.22.1"

\header {
  title = "Song Name here"
  composer = "by Kawing Chan"
  meter = "moderato"
  tagline = \markup {
    \tiny
    \center-column { 
       "Copyright © 2021 Kawing Chan" 
      \vspace #-0.3
      "Please respect Kawing's copyright and do not share, trade or distribute this PDF file on the Internet." 
      \vspace #-0.3
      "Doing so is against the artist's wishes and is a copyright violation. Thank you." 
      \vspace #-0.3
      \with-url #"https://lilypond.org/" { \italic "https://lilypond.org/" }
    } 
  }
}

upper = \relative c'' {
  \clef treble
  \key c \major
  \numericTimeSignature
  \time 4/4
  a4 b c d
  a4 b c d
  a4 b c e
  a4 b c d
  a4 b c d
}

lower = \relative c {
  \clef bass
  \key c \major
  \numericTimeSignature
  \time 4/4
  \set Staff.pedalSustainStyle = #'mixed
  \sustainOn c4 d e f 
  g1 \sustainOff \sustainOn
  a \sustainOff \sustainOn
  \once \override Staff.PianoPedalBracket.edge-height = #'(1 . 0)
  \once \override Staff.PianoPedalBracket.pedal-text = #'hi
  g4 \sustainOff \sustainOn f \sustainOff_\markup { \tiny \lower #3.21 \italic  "  (ped. simile)" } e d 
  c1
}

\score {
  \new PianoStaff <<
    \new Staff \upper
    \new Staff \lower
  >>  
  %  \pageBreak
  \layout {
      short-indent = 2\cm
      indent = 3\cm
  }
  \midi { }
}
