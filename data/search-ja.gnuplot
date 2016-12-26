load "style.gnuplot"

set datafile missing "NaN"

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.9

set bmargin 4

set xlabel "クエリー"
set ylabel "　実行時間（秒）\n（短いほど速い）"

set label 1 \
          "データ：日本語版Wikipedia" \
          at first -1,380 left
set label 2 \
          "レコード数：約185万" \
          at first -1,330 left
set label 3 \
          "InnoDBはクエリーによっては遅い" \
          textcolor "#ef2929" \
          at first -1,225 left
set label 4 \
          "Mroongaは安定して速い" \
          textcolor "#ef2929" \
          at first -1,25 left
set output "search-mroonga-innodb.pdf"
plot "search-ja.tsv" using 2:xtic(1) \
       title columnheader \
       linestyle 5, \
     "search-ja.tsv" using 6 \
       title columnheader \
       linestyle 1
