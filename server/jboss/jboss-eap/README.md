# image: cht/jboss-eap:6.4

建置前動作：
> 1. 此映像檔建置前需要將 jboss-eap 安裝 zip 手動放置於 installs中。
> 2. 於 host 主機先建立使用者 jboss，並將 jboss 的 uid 與 gid 設定為 1002.