import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import RubyPlugin from 'vite-plugin-ruby';
import FullReload from 'vite-plugin-full-reload';

export default defineConfig({
  plugins: [
    RubyPlugin(),
    vue(),
    FullReload(['config/routes.rb', 'app/views/**/*', 'app/javascript/**/*.vue', 'app/javascript/entrypoints/application.scss'], { delay: 100 }),
  ],
  server: {
    host: '0.0.0.0',
    port: 3036,
    watch: {
      usePolling: true,  // Docker環境でのファイルシステム問題を回避
    },
  },
  build: {
    outDir: 'public/vite/assets',
    emptyOutDir: true,
    rollupOptions: {
      output: {
        entryFileNames: 'assets/[name].js',
        chunkFileNames: 'assets/[name].js',
        assetFileNames: 'assets/[name].[ext]',
      },
    },
  },
});
