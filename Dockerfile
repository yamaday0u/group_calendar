# 使用するイメージとバージョンを指定/Gemfileに記載されているバージョンに合わせる
FROM ruby:2.6.5

# yarnのインストール
# コマンドは主要なLinuxディストリビューションの1つであるUbuntuというOSのもの（簡単にいうとLinuxの流派の1つ）
# 参考：https://classic.yarnpkg.com/en/docs/install/#debian-stable（yarn公式サイト）
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# APTのパッケージリストを更新 & 各種パッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# コンテナ内での作業ディレクトリを指定
WORKDIR /group_calendar

# ローカルのGemfileとGemgile.lockをコンテナにコピー（左側がローカル、右側がコンテナ）
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

# bundlerをインストール
RUN gem install bundler
RUN yarn install
# bundlerでGemfileからgemをインストール
RUN gem install babel-source -v 5.8.35
RUN bundle install

# ローカルのアプリ内の全てのファイルやディレクトリをコンテナの作業ディレクトリないにコピー
COPY . /group_calendar

# entrypoint.shをコンテナの/usr/bin/にコピー
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# コンテナー起動時に毎回実行されるスクリプトを追加
ENTRYPOINT ["entrypoint.sh"]

# コンテナの接続先のポートを指定
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]