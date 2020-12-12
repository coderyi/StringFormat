### CocoaPods


```ruby
pod 'StringFormat'
```


## Features

- StringFormat
	- Date
	- DeviceType
	- Duration
	- Geo
	- Locale
	- Number
	- URLEscaping
- String Extension
	- Image
	- URL
	- Emoji
	- Hash
	- Padding
	- File

## Usage

```
StringFormat.stringForDeviceType() // iPhone
StringFormat.stringForDuration(122) // 2:02
StringFormat.isValidUrl("https://github.com") // true

var test: String = "hello"
test = test.rightJustified(width: 6) // " hello"
```

## License
Released under [MIT License](LICENSE).
