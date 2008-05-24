NB. Tests for ziptrees
NB. To run all tests, select all file contents and choose Run|Selection

load '~addons/arc/ziptrees/ziptrees.ijs'

SRCDIR=: jpath '~.system/tools'
TRGZIP=: jpath '~temp/toolstree.zip'
TRGDIR=: jpath '~temp/newdir'
isMatch=: 'no difference' -: _1 {:: [: <;._2 LF ,~ ]

TRGZIP ziptree SRCDIR  NB. zip directory tree
TRGDIR unziptree TRGZIP NB. unzip of zipped directory tree

'Trees are not the same' assert isMatch 1 0 dircompare SRCDIR;TRGDIR

NB. clean up
'zip not erased' assert ferase TRGZIP
'file(s) not erased' assert ferase {."1 dirtree TRGDIR
'dir(s) not erased'  assert ferase |.dirpath TRGDIR
'directory still exists' assert -. direxist TRGDIR
'All tests passed OK'
