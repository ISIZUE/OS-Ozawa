 ; eOS
 ; TAB=4

		ORG		0x7c00			; このプログラムがどこに読み込まれているか

 ; 以下は標準的なFAT12フォーマットフロッピーディスクのための記述

		JMP		entry
		DB		0x90
		DB		"EOSIPL  "		; ブートセクタの名前を自由に書いてよい（8バイト）
		DW		512				; 1セクタの大きさ（512にしなければならない）
		DB		1				; クラスタの大きさ（1セクタにしなければならない）
		DW		1				; FATがどこから始まるか（普通は1セクタ目からにする）
		DB		2				; FATの個数（2にしなければならない）
		DW		224				; ルートディレクトリ領域の大きさ（普通は224エントリにする）
		DW		2880			; このドライブの大きさ（2880セクタにしなければならない）
		DB		0xf0			; メディアのタイプ（0xf0にしなければならない）
		DW		9				; FAT領域の長さ（9セクタにしなければいけない）
		DW		18				; 1トラックにいくつセクタがあるか（18にしなければいけない）
		DW		2				; ヘッドの数（2にしなければいけない）
		DD		0				; パーティションを使ってないのでここは必ず0
		DD		2880			; このドライブの大きさをもう一度書く
		DB		0,0,0x29		; この値にしておけばよいらしい
		DD		0xffffffff		; ボリュームシリアル番号？
		DB		"E-OS       "	; ディスクの名前（11バイト）
		DB		"FAT12   "		; フォーマットの名前（8バイト）
		RESB	18				; とりあえず18バイトあけておく

 ; プログラム本体
		
 entry:
		MOV		AX,0			; レジスタ初期化
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
 putloop:
		MOV		AL,[SI]
		ADD		SI,1			; SIに1を足す
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; 一文字表示ファンクション
		MOV		BX,15			; カラーコード
		INT		0x10			; ビデオBIOS呼び出し
		JMP		putloop
 fin:
		HLT						; 何かあるまでCPUを停止させる
		JMP		fin				; 無限ループ

 msg:
		DB		0x0a, 0x0a		; 改行2つ
		DB		"eOS"
		DB		0x0a
		DB		"ABC"
		DB		0x0a			; 改行
		DB		"Are you O.K?"
		DB		0x0a, 0x0a, 0x0a
		DB		"Oh..."
		DB		0x0a
		DB		"Startup"
		DB		0x0a
		DB		"."
		DB		0x0a
		DB		"."
		DB		0x0a
		DB		"."
		DB		0x0a,0x0a
		DB		"Here we go"
		DB		0

		RESB	0x7dfe-$		; 0x7dfeまでを0x00で埋める命令

		DB		0x55, 0xaa

