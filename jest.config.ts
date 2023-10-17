export default {
  roots: ['spec/javascript'],
  testEnvironmentOptions: {
    customExportConditions: ['node', 'node-addons']
  },
  moduleFileExtensions: ['js', 'vue', 'ts'],
  moduleDirectories: ['node_modules', 'app/javascript/src'],
  transform: {
    '.*\\.(vue)$': '@vue/vue3-jest',
    '^.+\\.js$': 'babel-jest'
  },
  testEnvironment: 'jsdom',
  preset: 'ts-jest'
}
