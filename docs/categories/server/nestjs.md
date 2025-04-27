# Nest.js

Nest.js 是一个用于构建高效、可靠且可扩展的服务器端应用程序的 Node.js 框架。它结合了面向对象编程(OOP)、函数式编程(FP)和函数响应式编程(FRP)的元素，为开发者提供了一个企业级的框架。

## Nest.js 核心特性

### 1. 模块化架构

Nest.js 使用模块来组织应用程序代码，每个模块封装了相关的功能。

```typescript
// cats.module.ts
import { Module } from "@nestjs/common";
import { CatsController } from "./cats.controller";
import { CatsService } from "./cats.service";

@Module({
  controllers: [CatsController],
  providers: [CatsService],
  exports: [CatsService],
})
export class CatsModule {}
```

### 2. 依赖注入

Nest.js 内置了强大的依赖注入系统，简化了组件之间的关系管理。

```typescript
// cats.service.ts
import { Injectable } from "@nestjs/common";
import { Cat } from "./interfaces/cat.interface";

@Injectable()
export class CatsService {
  private readonly cats: Cat[] = [];

  create(cat: Cat) {
    this.cats.push(cat);
  }

  findAll(): Cat[] {
    return this.cats;
  }
}
```

### 3. 装饰器

Nest.js 广泛使用装饰器来定义路由、中间件、过滤器等。

```typescript
// cats.controller.ts
import { Controller, Get, Post, Body } from "@nestjs/common";
import { CatsService } from "./cats.service";
import { CreateCatDto } from "./dto/create-cat.dto";
import { Cat } from "./interfaces/cat.interface";

@Controller("cats")
export class CatsController {
  constructor(private catsService: CatsService) {}

  @Post()
  async create(@Body() createCatDto: CreateCatDto) {
    this.catsService.create(createCatDto);
  }

  @Get()
  async findAll(): Promise<Cat[]> {
    return this.catsService.findAll();
  }
}
```

### 4. 中间件

Nest.js 支持 Express 风格的中间件，可以在路由处理程序之前执行代码。

```typescript
// logger.middleware.ts
import { Injectable, NestMiddleware } from "@nestjs/common";
import { Request, Response, NextFunction } from "express";

@Injectable()
export class LoggerMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    console.log("Request...");
    next();
  }
}
```

### 5. 异常过滤器

Nest.js 提供了异常层，可以处理整个应用程序中的所有未处理的异常。

```typescript
// http-exception.filter.ts
import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpException,
} from "@nestjs/common";
import { Request, Response } from "express";

@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
  catch(exception: HttpException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const request = ctx.getRequest<Request>();
    const status = exception.getStatus();

    response.status(status).json({
      statusCode: status,
      timestamp: new Date().toISOString(),
      path: request.url,
    });
  }
}
```

## Nest.js 高级特性

### 微服务架构

Nest.js 提供了构建微服务的强大支持，支持多种传输方式，如 TCP、Redis、MQTT 等。

```typescript
// main.ts
import { NestFactory } from "@nestjs/core";
import { Transport, MicroserviceOptions } from "@nestjs/microservices";
import { AppModule } from "./app.module";

async function bootstrap() {
  const app = await NestFactory.createMicroservice<MicroserviceOptions>(
    AppModule,
    {
      transport: Transport.TCP,
      options: {
        host: "127.0.0.1",
        port: 8877,
      },
    }
  );
  await app.listen();
}
bootstrap();
```

### GraphQL 支持

Nest.js 提供了 GraphQL 模块，可以轻松创建 GraphQL API。

```typescript
// app.module.ts
import { Module } from "@nestjs/common";
import { GraphQLModule } from "@nestjs/graphql";
import { ApolloDriver, ApolloDriverConfig } from "@nestjs/apollo";

@Module({
  imports: [
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: "schema.gql",
    }),
  ],
})
export class AppModule {}
```

### WebSocket 支持

Nest.js 提供了实时通信的支持，可以轻松创建 WebSocket 服务器。

```typescript
// events.gateway.ts
import {
  WebSocketGateway,
  SubscribeMessage,
  MessageBody,
} from "@nestjs/websockets";

@WebSocketGateway(80, { namespace: "events" })
export class EventsGateway {
  @SubscribeMessage("events")
  handleEvent(@MessageBody() data: string): string {
    return data;
  }
}
```

## Nest.js 最佳实践

1. **使用 DTOs**：定义数据传输对象，确保类型安全和数据验证
2. **遵循模块化架构**：将相关功能组织在一起，保持代码的可维护性
3. **使用依赖注入**：利用依赖注入进行组件之间的松耦合
4. **编写单元测试**：Nest.js 提供了强大的测试工具
5. **使用拦截器和过滤器**：处理横切关注点，如日志记录、错误处理等

## Nest.js 生态系统

- **@nestjs/typeorm**：TypeORM 集成，用于数据库访问
- **@nestjs/mongoose**：Mongoose 集成，用于 MongoDB
- **@nestjs/swagger**：自动生成 API 文档
- **@nestjs/config**：配置管理
- **@nestjs/jwt**：JWT 认证支持

## 学习资源

- [Nest.js 官方文档](https://docs.nestjs.com/)
- [Nest.js GitHub 仓库](https://github.com/nestjs/nest)
- [Nest.js 示例项目](https://github.com/nestjs/nest/tree/master/sample)
- [Nest.js 实战教程](https://wanago.io/courses/api-with-nestjs/)
