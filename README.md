# AutoWindowsUpdatePS
自動でWindowsUpdateを行います。  
たまにしか使わない端末のアップデートを時間かけてしちゃやーよとのことでした。

## 使い方
### クライアント単体でWindowsUpdateする場合
1.Config.ps1へログインユーザ等の設定を書きます。  
2.WindowsUpdateしなければいけない端末へWindowsUpdatePSフォルダを設置  
3.WindowsUpdatePSフォルダ内にあるStart.batを管理者権限で実行  

### ホストからクライアントへリモートでWindowsUpdateする場合
1.Config.ps1へログインユーザ等の設定を書きます。  
2.WindowsUpdatePSを予めクライアントに設置します。（C:\WindowsUpdatePSを想定しています）  
3.Host\Remote.batにクライアントのホスト名とログイン情報を設定して実行します。  

## テスト済みOS
Windows 7  
Windows 10  

## 起動はWOLでやろう！
[https://github.com/sori883/WindowsUpdatePS](https://github.com/sori883/WindowsUpdatePS)