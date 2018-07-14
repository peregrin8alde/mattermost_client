# mattermost_client
MattermostのRESTful APIを使ったクライアント

- https://api.mattermost.com/
- 公式のjavascriptドライバを元に、必要最小限のものを抜粋して流用
    - https://github.com/mattermost/mattermost-redux/blob/master/src/client/client4.js
    - `yarn add babel-polyfill`
    - `yarn add isomorphic-fetch`
- CORS関連で色々作業が必要
    - サーバ設定の`Connections`でCORSの設定（許可する接続元）
      例：http://0.0.0.0:8065 http://0.0.0.0:58080
        - サーバ再起動が必要な可能性あり
        - 複数は空白区切り
        - 自身も許可しておかないとサーバ内の処理でも繋がらなくなる可能性あり
    - `newOptions.mode = 'cors'`
    - `credentials`を有効（include）にすると`Access-Control-Allow-Credentials`をサーバが返さないせいでエラーになる。
        - issueが作成されており、古いバージョンだとどうしようもないかも。
    - 以下のトラブルが発生
        - CORS用前処理のOPTION時にはエラーにならず、主処理の方で発生
        - 処理実行の契機であるボタンクリック時にSUBMIT扱いでリロードが行われていたせい。
        ```
        Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource at http://0.0.0.0:8065/api/v4/users/login. (Reason: CORS request did not succeed).
        ```
