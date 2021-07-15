## ThingsRUsデモ

IRISのインターオペラビリティ機能を説明するためのデモ
オンラインストアのシステムの裏で様々な社内システムが動くというシナリオ
（在庫管理、出荷管理、CRMなど）

状況をビジュアルに示すダッシュボード

ディスカウントのレートによって承認プロセスが必要

## 前提条件

このツールを動かすためには、Docker for WindowsまたはDocker for MACをインストールする必要があります。


## セットアップ

tru.zipを適当なディレクトリーにおいて、zipツールで展開します。

Windowsではコマンドプロンプト、MACではターミナルを起動します。

例えば、Windowsでc:\temp\truに展開したとすると

```
>cd c:\
>cd temp
>cd tru
>docker-compose up -d --build

```
を順番に実行してください。

urlに指定するポート番号は、デフォルト52782になっていますが、変更したい場合は、docker-compose.ymlの設定を変更してください。


## アプリケーションの実行方法

ブラウザで以下のurlを指定します。

http://localhost:52782/csp/user/TRU.web.TRUApp.cls?$NAMESPACE=USER&IRISUsername=_system&IRISPassword=SYS

左のメニューから注文するを選択し、右の画面で注文入力する


### 管理ポータル

[localhost:52782/csp/sys/%25CSP.Portal.Home.zen?IRISUsername=_system&IRISPassword=SYS](http://localhost:52782/csp/sys/%25CSP.Portal.Home.zen?IRISUsername=_system&IRISPassword=SYS)

### BAMデモ

```
>docker exec -ti TRUDemo sh

$ iris session iris

>do ##class(TRU.WebService).Test(1000)
```

## 環境の削除

新しくデータをを再ロードするまえには、以下を実行してください。

```
>cd c:\
>cd temp
>cd tru
>docker-compose stop
>docker-compose rm
yと答える
```
