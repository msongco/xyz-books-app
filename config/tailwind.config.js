const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },

      colors: {
        'navy-blue': '#131C49',
        'purple': '#535CEF',
        'light-blue': '#49CDF7',
        'golden-yellow': '#F8BC49',
        'gray': '#898DA4',
        'sky-blue': '#2E92F1',
        'light-gray': '#F0F4F7',
        'dark-gray': '#4F5E6D',
        'light-purple': '#F0F0FE'
      },
    },

    
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
