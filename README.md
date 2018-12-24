# AutoWindowsUpdateAndAdobeUpdate
自動でWindowsUpdateを行います。
Adobe Readerも当てなければいけなくなりました
たまにしか使わない端末のアップデートを時間かけてしちゃやーよとのことでした。

また試行回数もつけました。
なんてこったい

# 使い方
## クライアント単体でWindowsUpdateとAdobeパッチを適用する場合
1.Config.ps1へログインユーザ等の設定を書きます。
2.適用しなければいけない端末へAWPSフォルダを設置
3.AWPSフォルダ内にあるStart.batを管理者権限で実行

## ホストからクライアントへリモートでWindowsUpdateとAdobeのパッチを適用する場合
1.Config.ps1へログインユーザ等の設定を書きます。
2.AWPSを予めクライアントに設置します。（C:\AWPSを想定しています）
3.Host\Remote.batにクライアントのホスト名とログイン情報を設定して実行します。

# OS
Windows 10
