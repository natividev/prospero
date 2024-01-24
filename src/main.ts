import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { VersioningType } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const APP_ROUTE_PREFIX = 'api';
  app
    .enableVersioning({
      defaultVersion: '1',
      type: VersioningType.URI,
    })
    .setGlobalPrefix(APP_ROUTE_PREFIX);

  await app.listen(8000);
  console.log({ app });
}
bootstrap();
