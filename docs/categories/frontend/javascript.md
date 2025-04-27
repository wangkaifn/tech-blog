# JavaScript 基础与进阶

JavaScript 是前端开发的核心语言，掌握 JavaScript 对于前端开发者至关重要。

## JavaScript 基础知识

### 变量与数据类型

JavaScript 中的基本数据类型包括：

- **字符串(String)**: 用于表示文本数据
- **数字(Number)**: 用于表示数值
- **布尔(Boolean)**: true 或 false
- **undefined**: 表示变量未赋值
- **null**: 表示空值或不存在的对象
- **Symbol**: ES6 新增，表示唯一的标识符
- **BigInt**: 用于表示任意精度的整数

引用数据类型：

- **对象(Object)**: 包括普通对象、数组、函数等

### 函数

JavaScript 中的函数是一等公民，可以作为参数传递、赋值给变量或从函数返回。

```javascript
// 函数声明
function add(a, b) {
  return a + b;
}

// 函数表达式
const multiply = function (a, b) {
  return a * b;
};

// 箭头函数
const divide = (a, b) => a / b;
```

## ES6+新特性

### 解构赋值

```javascript
// 数组解构
const [a, b] = [1, 2];

// 对象解构
const { name, age } = { name: "John", age: 30 };
```

### 模板字符串

```javascript
const name = "World";
console.log(`Hello, ${name}!`); // 输出: Hello, World!
```

### Promise 和异步编程

```javascript
const fetchData = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("数据获取成功");
    }, 1000);
  });
};

fetchData()
  .then((data) => console.log(data))
  .catch((error) => console.error(error));
```

### async/await

```javascript
const fetchUserData = async () => {
  try {
    const response = await fetch("https://api.example.com/user");
    const data = await response.json();
    return data;
  } catch (error) {
    console.error("获取用户数据失败:", error);
  }
};
```

## JavaScript 性能优化

### 避免全局变量

全局变量会增加命名冲突的风险，并可能导致内存泄漏。

### 使用防抖和节流

在处理频繁触发的事件(如滚动、调整窗口大小等)时，使用防抖和节流可以提高性能。

```javascript
// 防抖函数
function debounce(fn, delay) {
  let timer = null;
  return function () {
    const context = this;
    const args = arguments;
    clearTimeout(timer);
    timer = setTimeout(() => {
      fn.apply(context, args);
    }, delay);
  };
}

// 节流函数
function throttle(fn, interval) {
  let lastTime = 0;
  return function () {
    const context = this;
    const args = arguments;
    const now = Date.now();
    if (now - lastTime >= interval) {
      fn.apply(context, args);
      lastTime = now;
    }
  };
}
```

## 前沿 JavaScript 技术

### TypeScript

TypeScript 是 JavaScript 的超集，添加了静态类型检查，提高了代码的可维护性和可靠性。

### WebAssembly

WebAssembly 允许在浏览器中运行接近原生性能的代码，为 Web 应用提供了更高的性能。

## 学习资源

- [MDN Web 文档](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript)
- [JavaScript.info](https://zh.javascript.info/)
- [ES6 标准入门](https://es6.ruanyifeng.com/)
