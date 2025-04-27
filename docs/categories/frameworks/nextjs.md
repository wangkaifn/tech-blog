# Next.js

Next.js 是一个基于 React 的全栈框架，为 React 应用提供了服务端渲染、静态站点生成、API 路由等强大功能。

## Next.js 核心特性

### 1. 服务端渲染(SSR)

Next.js 可以在服务器上预渲染页面，提高首屏加载速度和 SEO 表现。

```jsx
// pages/index.js
export default function Home({ data }) {
  return (
    <div>
      <h1>Hello, {data.name}!</h1>
    </div>
  );
}

// 服务端获取数据
export async function getServerSideProps() {
  const res = await fetch("https://api.example.com/data");
  const data = await res.json();

  return {
    props: { data },
  };
}
```

### 2. 静态站点生成(SSG)

预先生成静态 HTML 页面，提供极快的加载速度。

```jsx
// pages/posts/[id].js
export default function Post({ post }) {
  return (
    <div>
      <h1>{post.title}</h1>
      <p>{post.content}</p>
    </div>
  );
}

// 静态生成路径
export async function getStaticPaths() {
  const res = await fetch("https://api.example.com/posts");
  const posts = await res.json();

  const paths = posts.map((post) => ({
    params: { id: post.id.toString() },
  }));

  return { paths, fallback: false };
}

// 静态生成内容
export async function getStaticProps({ params }) {
  const res = await fetch(`https://api.example.com/posts/${params.id}`);
  const post = await res.json();

  return { props: { post } };
}
```

### 3. 增量静态再生成(ISR)

允许静态生成的页面在后台重新生成，无需重新构建整个站点。

```jsx
export async function getStaticProps() {
  const res = await fetch("https://api.example.com/data");
  const data = await res.json();

  return {
    props: { data },
    revalidate: 60, // 每60秒重新生成
  };
}
```

### 4. 文件系统路由

基于文件系统的路由自动生成，无需手动配置路由。

```
pages/
├── index.js         // 对应路由 /
├── about.js         // 对应路由 /about
└── posts/
    ├── index.js     // 对应路由 /posts
    └── [id].js      // 对应路由 /posts/:id
```

### 5. API Routes

允许在 Next.js 应用中创建 API 端点。

```jsx
// pages/api/hello.js
export default function handler(req, res) {
  res.status(200).json({ name: "John Doe" });
}
```

## Next.js 最佳实践

1. **页面组件保持精简**：将业务逻辑和复杂组件拆分为单独的文件
2. **使用布局组件**：创建可复用的布局组件
3. **合理使用 SSR 和 SSG**：根据页面内容特性选择合适的渲染方式
4. **利用 Image 组件**：使用 Next.js 内置的 Image 组件进行图片优化
5. **使用 SWR 进行客户端数据获取**：结合服务端渲染与客户端数据获取

## Next.js 生态系统

- **Vercel**：Next.js 开发团队提供的部署平台，为 Next.js 应用提供最佳支持
- **next-auth**：为 Next.js 应用提供认证解决方案
- **next-i18next**：国际化解决方案
- **next-seo**：SEO 优化工具

## 学习资源

- [Next.js 官方文档](https://nextjs.org/docs)
- [Next.js GitHub 仓库](https://github.com/vercel/next.js)
- [Next.js 示例项目](https://github.com/vercel/next.js/tree/canary/examples)
