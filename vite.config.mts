import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import VuePlugin from '@vitejs/plugin-vue'
import FullReload from 'vite-plugin-full-reload'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    VuePlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*', 'app/javascript/**/*.vue'], { delay: 100 }),
  ],
  build: {
    outDir: 'public/vite/assets', // 出力ディレクトリの指定
    emptyOutDir: true, // ビルド時に出力ディレクトリを空にする
    rollupOptions: {
      input: {
        'javascript/application': 'app/javascript/entrypoints/application.scss'
      },
      output: {
        entryFileNames: 'assets/[name].js',
        chunkFileNames: 'assets/[name].js',
        assetFileNames: 'assets/[name].[ext]',
      },
    },
  },
})
