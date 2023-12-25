#!/bin/bash

echo "パスワードマネージャーへようこそ!"

while true ; do
	echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
	read action

	if [ "$action" = "Add Password" ] ; then
		echo "サービス名を入力してください："
		read service_name
		echo "ユーザー名を入力してください："
		read user_name
		echo "パスワードを入力してください："
		read password

		echo "$service_name:$user_name:$password" >> passwords.md
		echo "パスワードの追加は成功しました。"

	elif [ "$action" = "Get Password" ] ; then
		echo "サービス名を入力してください："
		read search_service
	        
	        if grep -q "^$search_service:" passwords.md ; then
                         grep "^${search_service}:" passwords.md | sed "s/:/ /g" | awk '{print "サービス名: " $1 "\nユーザー名: " $2 "\nパスワード: " $3}'
		else
			echo "そのサービスは登録されていません。"
		fi

	elif [ "$action" = "Exit" ] ; then
		echo "Thank you!"
		break
	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
	fi
done

