<!-- omit in toc -->
# Udemy - ゼロから学ぶWebアプリケーション Vue3 x Typescript

- URL
  - https://www.udemy.com/course/trial-vue3-x-typescript/learn/lecture/30821240#overview
  

<br>

---

<br>

<!-- omit in toc -->
# 目次

- [変数 (let と const)](#変数-let-と-const)
- [関数](#関数)
  - [アロー関数](#アロー関数)
    - [基本記法](#基本記法)
      - [引数が１つの場合　⇒　（　）を省略可能](#引数が１つの場合を省略可能)
      - [引数がない場合 or 引数が複数の場合　⇒　(　)は必須](#引数がない場合-or-引数が複数の場合は必須)
- [オブジェクト](#オブジェクト)
- [スプレッド構文とレスト構文](#スプレッド構文とレスト構文)
  - [スプレッド構文](#スプレッド構文)
  - [レスト構文](#レスト構文)
- [高階関数 (filter, mapなど)](#高階関数-filter-mapなど)
  - [Udemyの例](#udemyの例)
- [Typescriptと型](#typescriptと型)
- [viteで作られたアプリケーション](#viteで作られたアプリケーション)
  - [「.vue」ファイルのメイン構成](#vueファイルのメイン構成)
- [template, script, style](#template-script-style)
- [template](#template)
- [script](#script)
  - [コンポーネントのimport](#コンポーネントのimport)
- [style](#style)

<br>

---

<br>


# 変数 (let と const)

```javascript
//letは代入可能
let example = 1;
example=2;

//constは代入できない
const example = 1;
example = 2; //←　エラー

//ただし、constでも、オブジェクトの場合は中身の要素の上書きは可能
const obj = {a:1, b:2, c: 3};
obj.a = 10;
```


# 関数

```javascript
// function式を使う場合（名前付き関数）
function hello(name){
    let message = 'hello ' + name;
    return message;
}
console.log(hello('hoge'));

//変数にも代入できる
const result = hello('hoge2');
console.log(result);

//無名関数（オブジェクト）を変数に代入して利用可能
const helloFunc = function(name){
    let message = 'hello ' + name;
    return message;
}

console.log(helloFunc('hoge3'));
```

## アロー関数

(memo)苦手分野なので、Udemy以外のコンテンツも引用して覚える！

- 【JavaScript】１分で理解する！=>アロー関数の基本
  - https://it-biz.online/web-design/arrow-function/#toc3

### 基本記法

```javascript
let sample = () => {
  console.log( "Hello World!" );
}

sample();
```

#### 引数が１つの場合　⇒　（　）を省略可能

```javascript
let sample2 = n => n * 2;   //引数が１つの場合は引数の（）が不要

 console.log(sample2(4));

```

#### 引数がない場合 or 引数が複数の場合　⇒　(　)は必須

```javascript
let sample = () => {
  console.log( "Hello World!" );
}

sample();

const sample2 = (a,b) => {
     console.log( "Hello World! " + a + " and " + b ); 
}

sample2("foo","bar");
```

<br>

---

<br>


# オブジェクト

```javascript

const obj = {a:1, b:2, c: 3};
console.log(obj);

//--- 結果
[object Object] {
  a: 1,
  b: 2,
  c: 3
}

const obj2 = obj;
console.log(obj2);  //結果は同じ

//オブジェクトの罠
//オブジェクトの要素に値を代入してしまうと、obj,obj2とも影響を受けてしまう
obj.a = 2;     
```

<br>

---

<br>


# スプレッド構文とレスト構文

(memo)未経験分野なので、Udemy以外のコンテンツも引用して覚える！

- 【JavaScript】「スプレッド構文」と「レスト構文」について
  - https://qiita.com/kamijodev/items/89543ca267ac9ad51529
- 【JavaScript】スプレッド構文とレスト構文との違い
  - https://loglogme.com/news/javascript-spread-rest/


| スプレッド構文 | レスト構文 |
|----------------|------------|
| 展開           | 集約       |


## スプレッド構文

スプレッド構文は、配列やオブジェクトの要素を展開する際に使用されます。<br>
配列や関数呼び出しの場所で使用できます。<br><br>


```javascript
//Udeny の例
const array1 = [1,2];
const array2 = [3,4];
const result = [...array1, ...array2];   //結果：[1,2,3,4]

//Udeny の例 オブジェクトのケース
const person = {
    name: 'john',
    age: 22
};
const obj = {...person, height: 180};
/**
  [結果]
  [object Object] {
   age: 22,
   name: "john",
   height: 180
}
 */


//例）配列の場合
let arr1 = [1, 2, 3];
let arr2 = [...arr1, 4, 5];  // [1, 2, 3, 4, 5]

//例）関数呼び出しの場合
function myFunction(x, y, z) {
  console.log(x, y, z);
}
let args = [0, 1, 2];
myFunction(...args);  // 0 1 2

//例）オブジェクトの場合
let obj1 = {a: 1, b: 2};
let obj2 = {...obj1, c: 3};  // {a: 1, b: 2, c: 3}
```


## レスト構文

レスト構文は、複数の要素を配列にまとめる際に使用される。<br>
主に関数のパラメータとして使用される場面が多いです。<br><br>

```javascript
//例）関数のパラメータの場合
function myFunction(a, ...args) {
  console.log(a);  // 1
  console.log(args);  // [2, 3, 4]
}
myFunction(1, 2, 3, 4);

//　→　この場合、args は 2, 3, 4 という3つの引数を持つ配列になります。
```

<br>

---

<br>

# 高階関数 (filter, mapなど)

- JavaScriptの高階関数とは
  - https://zenn.dev/joo_hashi/articles/e5d20e2875aa55


> [!TIP]
> JavaScriptにおける高階関数（Higher-Order Function）は、関数を引数として受け取ったり、関数を戻り値として返す関数のことを指します。高階関数は、関数をデータとして扱うことができる特性を活かし、柔軟なプログラミングを実現するために使用されます。


```javascript
function higherOrderFunction(callback) {
    console.log("高階関数の処理");
    callback();
}

function callbackFunction() {
    console.log("コールバック関数の処理");
}

higherOrderFunction(callbackFunction);
```


## Udemyの例

```javascript
const words = ['spray', 'limit', 'elite', 'exuberant'];
const result = words.filter(word => word.length > 6 );
// [結果]　=> ["exuberant"]

//filter()内で、アロー関数を使わない場合
const filtered = (word) => {return word.length > 6;};
const result = words.filter(filtered);

//-------
const array = [1, 4, 9, 16];
const mappedArray = array.map(x => x * 2);
// [結果] => [2, 8, 18, 32]


//map()内で、アロー関数を使わない場合
const mapped = (x) => {
    return x * 2;
};
const mappedArray = array.map(mapped);
```


<br>

---

<br>

#  Typescriptと型

```typescript
//変数の場合
//const|let 変数名: 型名 = 内容;
const example: string = 'hoge';

//関数の場合
// (引数名: 型名, 引数名: 型名,・・・):戻り値の型
const hello = (name: string): string => {
    return 'hello ' + name;
};
hello(example);     //'hello hoge';
```


<br>

---

<br>


# viteで作られたアプリケーション

```shell
.
├── README.md
├── index.html         //最初に読み込まれるエントリーポイント
├── package-lock.json
├── package.json      //このアプリケーションが依存しているパッケージ定義
├── public
│   └── vite.svg
├── src
│   ├── App.vue       // 拡張子がvueのファイルは、VueのF/Wを利用していること
│   │                 // を明示（最初にApp.vueが読み込まれる）
│   ├── assets
│   │   └── vue.svg
│   ├── components
│   │   └── HelloWorld.vue
│   ├── main.ts       // App.vueを呼び出している
│   ├── style.css
│   └── vite-env.d.ts
├── tsconfig.app.json
├── tsconfig.json
├── tsconfig.node.json
└── vite.config.ts

```

## 「.vue」ファイルのメイン構成

```xml
<script setup lang="ts">～</script>

<template>～</template>

<style>～</style>
```


<br>

---

<br>

# template, script, style

```xml
<script setup lang="ts">
<!--JS/TSのロジック実装箇所-->
</script>


<template>
<!--実際に表示するためのHTMLタグやコンポーネントを配置させる-->
</template>


<style>
<!--templateに適用するCSS定義エリア-->
</style>

```


<br>

---

<br>

# template

```javascript
<script>
defineProps<{ 変数名: 型 }>()
const 変数=ref(初期値)
</script>

<template>
{{/* script タグ内で定義・実装された変数は2重の波かっこ*/}}
{{ 変数 }}

<button type="button" @イベント="関数"> {{refで宣言した変数など}}</button>

</template>
```

<br>

---

<br>

# script

JS/TSの処理を実装する

```javascript
<script>
const hello = "Hello world";
</script>

<template>
{{ hello }}
</template>
```

## コンポーネントのimport

```javascript
<script setup lang="ts">
import コンポーネントを表す名前 from './components/読み込むコンポーネント名.vue'
</script>

<template>
<コンポーネントを表す名前 変数=渡したい内容 />
</template>


```
<br>

---

<br>


# style

スタイルシート定義場所であり、記法は`基本CSSと同じでよい`

```javascript
<style scoped>
/* ↑↑↑　scopedの付加は推奨 */
.クラス名 {
  属性: 値;
}
</style>
```

<br>

---
---
---

<br>

[END]


[← READMEへ](../README.md)
