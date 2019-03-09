# BinaryTransformer

Interface and executor for a transformers to transform byte arrays in a pipeline-based
design programmatically in ruby.

This can be used to parse text blobs, resize image, compress music, encode video... etc

Currently, these binary transformers are available:
- [Image Resizer](https://gitlab.com/ruby-gem/image-resizer)
- [PngQuant](https://gitlab.com/ruby-gem/pngquant)
- [JpegOptim](https://gitlab.com/ruby-gem/jpegoptim)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'binary_transformer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install binary_transformer

## Usage

### Using transformers

Assuming you have a few image transformers <br>
`ImageCompressor` that compress images, <br>
 `ImageResizer` that resizes images, <br>
 `Sepia` that converts image to sepia, <br>
 and `Blur` that blurs the image <br>
 which all implements
the `BinaryTransformer::Transformer` interface, the usage is as follows:

```ruby
# Transformer instances
compressor = ImageCompressor.new
resize = ImageResizer.new
sepia = SepiaTransformer.new
blur = BlurTransformer.new
# Obtain Binary
binary IO.binread "image.png"

# Extend the binary
binary.extend StreamLike

# Pipe the binary through the transformers. Use >> to chain and >  for the last transformer
converted = binary >> compressor >> resize >> sepia > blur  
 
 # Write the binary back
 IO.binwrite "converted.png", converted 
```

## Development

After cloning, run to install dependencies
```bash
$ bundle install
``` 

To run unit tests:
```bash
$ bundle exec rspec
```
## Contributing

Bug reports and pull requests are welcome on GitLab at https://gitlab.com/ruby-gem/binary-transformer. 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected 
to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of Conduct

Everyone interacting in the BinaryTransformer project’s codebases, issue trackers,
 chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).