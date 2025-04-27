# Nuxt.js

Nuxt.js 是一个基于 Vue.js 的服务端渲染框架，提供了构建现代 Web 应用的全套工具和最佳实践。

## Nuxt.js 核心特性

### 1. 服务端渲染(SSR)

Nuxt.js 允许 Vue 应用在服务器端渲染，提高首屏加载速度和 SEO 表现。

```vue
<template>
  <div>
    <h1>{{ title }}</h1>
    <p>{{ description }}</p>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios }) {
    const { title, description } = await $axios.$get(
      "https://api.example.com/page-data"
    );
    return { title, description };
  },
};
</script>
```

### 2. 静态站点生成(SSG)

通过`nuxt generate`命令生成完全静态的 HTML 应用，无需服务器。

```js
// nuxt.config.js
export default {
  target: "static",

  generate: {
    async routes() {
      const { data } = await axios.get("https://api.example.com/posts");
      return data.map((post) => `/posts/${post.id}`);
    },
  },
};
```

### 3. 自动路由

基于`pages`目录的文件结构自动生成路由配置。

```
pages/
├── index.vue         // 对应路由 /
├── about.vue         // 对应路由 /about
└── posts/
    ├── index.vue     // 对应路由 /posts
    └── _id.vue       // 对应路由 /posts/:id
```

### 4. 模块化架构

Nuxt.js 提供了模块系统，可以轻松扩展核心功能。

```js
// nuxt.config.js
export default {
  modules: ["@nuxtjs/axios", "@nuxtjs/pwa", "@nuxt/content"],
};
```

### 5. 自动代码分割

Nuxt.js 会自动分割代码，优化应用加载性能。

## Nuxt.js 3 新特性

Nuxt 3 是基于 Vue 3、Vite 和 Nitro 构建的全新版本，带来了众多新特性：

1. **更小的包体积**：与 Nuxt 2 相比减少了 75%的体积
2. **Nitro 引擎**：全新的服务器引擎，支持多种部署平台
3. **Composition API**：支持 Vue 3 的 Composition API
4. **TypeScript 支持**：原生 TypeScript 支持，无需额外配置
5. **混合渲染**：在同一应用中支持 SSR、SSG 和 CSR

```vue
<script setup>
// Nuxt 3 with Composition API
const { data } = await useFetch("/api/users");
</script>

<template>
  <div>
    <h1>Users</h1>
    <ul>
      <li v-for="user in data" :key="user.id">
        {{ user.name }}
      </li>
    </ul>
  </div>
</template>
```

## Nuxt.js 最佳实践

1. **使用布局组件**：利用`layouts`目录创建可复用的布局
2. **利用中间件**：在`middleware`目录中定义路由中间件处理权限控制
3. **状态管理**：使用 Pinia 或 Vuex 进行状态管理
4. **利用插件系统**：在`plugins`目录中注册全局组件和功能
5. **使用 Nuxt Content**：对于内容丰富的网站，使用 Nuxt Content 模块管理 Markdown 内容

## Nuxt.js 生态系统

- **@nuxtjs/axios**：整合 Axios HTTP 客户端
- **@nuxtjs/pwa**：轻松创建 Progressive Web App
- **@nuxt/content**：强大的内容管理系统
- **@nuxtjs/auth**：身份验证模块
- **nuxt-i18n**：国际化支持

## 学习资源

- [Nuxt.js 官方文档](https://nuxt.com/docs)
- [Nuxt.js GitHub 仓库](https://github.com/nuxt/nuxt)
- [Nuxt.js 示例](https://nuxt.com/docs/examples/essentials/hello-world)
