// eslint-disable-next-line
module.exports = {
	testTimeout: 300000,
	watchPlugins: [
		'jest-watch-typeahead/filename',
		'jest-watch-typeahead/testname',
	],
    reporters: [ "default", "jest-junit" ]
}