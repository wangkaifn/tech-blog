<template>
  <div class="not-found">
    <div class="container">
      <h1 class="title">404</h1>
      <p class="message">页面不存在 | Page Not Found</p>
      <div class="action">
        <a class="link" href="/" aria-label="前往首页"> 返回首页 </a>
      </div>
      <div class="suggestions" v-if="suggestions.length">
        <p class="suggestion-heading">您可能在寻找:</p>
        <ul class="suggestion-list">
          <li v-for="suggestion in suggestions" :key="suggestion.link">
            <a :href="suggestion.link">{{ suggestion.text }}</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { useData } from "vitepress";

// 生成建议页面链接
const { site, theme } = useData();
const suggestions = computed(() => {
  // 添加一些主要的分类页面作为建议
  return [
    { text: "前端基础 - JavaScript", link: "/categories/frontend/javascript" },
    { text: "前端框架 - Vue", link: "/categories/frameworks/vue" },
    { text: "前端框架 - React", link: "/categories/frameworks/react" },
    { text: "前端框架 - Next.js", link: "/categories/frameworks/nextjs" },
    { text: "前端框架 - Nuxt.js", link: "/categories/frameworks/nuxtjs" },
    { text: "服务端框架 - Nest.js", link: "/categories/server/nestjs" },
    { text: "技术分类目录", link: "/categories/" },
  ];
});
</script>

<style scoped>
.not-found {
  padding: 4rem 1rem;
  text-align: center;
}

.container {
  margin: 0 auto;
  max-width: 28rem;
}

.title {
  font-size: 8rem;
  line-height: 1;
  font-weight: 800;
  margin: 0;
  color: var(--vp-c-brand);
  background: linear-gradient(
    90deg,
    var(--vp-c-brand-dark) 0%,
    var(--vp-c-brand) 100%
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.message {
  font-size: 1.5rem;
  line-height: 1.5;
  color: var(--vp-c-text-1);
  margin-top: 0.5rem;
  margin-bottom: 2rem;
}

.action {
  margin-top: 1.5rem;
}

.link {
  display: inline-block;
  background-color: var(--vp-c-brand);
  color: white;
  font-weight: 500;
  padding: 0.75rem 1.5rem;
  border-radius: 0.25rem;
  text-decoration: none;
  transition: background-color 0.2s;
}

.link:hover {
  background-color: var(--vp-c-brand-dark);
}

.suggestions {
  margin-top: 3rem;
  text-align: left;
  padding: 0 1rem;
}

.suggestion-heading {
  font-weight: 600;
  font-size: 1.1rem;
  color: var(--vp-c-text-2);
  margin-bottom: 0.75rem;
}

.suggestion-list {
  padding-left: 1.25rem;
  list-style-type: disc;
}

.suggestion-list a {
  color: var(--vp-c-text-1);
  text-decoration: none;
  transition: color 0.2s;
}

.suggestion-list a:hover {
  color: var(--vp-c-brand);
}
</style>
