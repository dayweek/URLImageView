# URLImageView

This subclass of UIImageView allows you to display remote images asynchronously with nice fade in effect and activity indicator.

## Usage

```objective-c
URLImageView *img = [[URLImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
[img padding:2]; // add padding to borders
[img loadURL: [NSURL URLWithString:[app_detail.images objectAtIndex:((page-1)*3+ii)]]  ];
[subview addSubview:img];
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request