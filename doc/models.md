# データモデル仕様書

## Todo モデル

### 概要
TODOアイテムを表現するためのデータモデル。Freezedを使用して実装された不変オブジェクト。

### 属性

| フィールド名 | 型 | 必須 | デフォルト値 | 説明 |
|------------|-------|---------|--------------|------|
| id | String | ✅ | - | TODOの一意識別子（UUID） |
| title | String | ✅ | - | TODOのタイトル |
| description | String? | - | null | TODOの詳細説明 |
| dueDate | DateTime? | - | null | 期限日時 |
| priority | Priority | - | Priority.medium | 優先度（high/medium/low） |
| isCompleted | bool | - | false | 完了状態 |
| createdAt | DateTime | ✅ | - | 作成日時 |
| updatedAt | DateTime | ✅ | - | 更新日時 |
| tags | List<String> | - | [] | 関連タグのリスト |

### ファクトリメソッド

#### Todo.create
新規TODOを作成するためのファクトリメソッド。

**パラメータ:**
- title: String（必須）- TODOのタイトル
- description: String?（オプション）- 詳細説明
- dueDate: DateTime?（オプション）- 期限日時
- priority: Priority?（オプション）- 優先度
- tags: List<String>?（オプション）- タグリスト

**処理内容:**
- IDを自動生成（UUID）
- 作成日時と更新日時を現在時刻に設定
- デフォルト値の適用（優先度：中、完了状態：false）

## TodoFilter モデル

### 概要
TODOリストのフィルタリングと並び替えの条件を表現するデータモデル。

### 属性

| フィールド名 | 型 | 必須 | デフォルト値 | 説明 |
|------------|-------|---------|--------------|------|
| searchQuery | String? | - | null | 検索キーワード |
| isCompleted | bool? | - | null | 完了状態でのフィルタリング |
| priority | Priority? | - | null | 優先度でのフィルタリング |
| tags | List<String>? | - | null | タグでのフィルタリング |
| sortBy | TodoSortBy | - | TodoSortBy.createdAt | ソート基準 |
| sortDescending | bool | - | false | 降順ソートフラグ |

### TodoSortBy 列挙型

TODOリストのソート基準を定義する列挙型。

**値:**
- dueDate: 期限日時でソート
- createdAt: 作成日時でソート
- priority: 優先度でソート
- title: タイトルでソート

### Priority 列挙型

TODOの優先度を定義する列挙型。

**値:**
- high: 高優先度
- medium: 中優先度
- low: 低優先度 