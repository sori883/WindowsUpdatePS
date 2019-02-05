## AutoWindowsUpdateAndAdobeUpdate
自動でWindowsUpdateを行います。   
なんてこったい  

## 使い方
***クライアント単体でWindowsUpdateとAdobeパッチを適用する場合***
1.Config.ps1へログインユーザ等の設定を書きます。  
2.適用しなければいけない端末へAWPSフォルダを設置  
3.AWPSフォルダ内にあるStart.batを管理者権限で実行  

***ホストからクライアントへリモートでWindowsUpdateとAdobeのパッチを適用する場合***
1.Config.ps1へログインユーザ等の設定を書きます。  
2.AWPSを予めクライアントに設置します。（C:\WUPSを想定しています。変更する場合はRemote.batのStartPathを変更してください。）  
3.Remote.batにログインユーザ等の設定を書きます。  
4.target.txtにクライアントのIPとかを指定してRemote.batを実行してください。  

## OS
Windows 7
Windows 10  

## 起動はWOLでやろう！
[https://github.com/sori883/WindowsUpdatePS](https://github.com/sori883/WindowsUpdatePS)
