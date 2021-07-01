# FFmpeg Puppet Module

- [FFmpeg Puppet Module](#ffmpeg-puppet-module)
  - [Description](#description)
  - [Setup](#setup)
    - [Requirements](#requirements)
    - [Getting Started](#getting-started)
      - [r10k / librarian-puppet](#r10k--librarian-puppet)
  - [Usage](#usage)
  - [Reference](#reference)
    - [Classes](#classes)
      - [Public Classes](#public-classes)
        - [Class: `ffmpeg`](#class-ffmpeg)
  - [Limitations](#limitations)
  - [Development](#development)

## Description

FFmpeg is a free software project that produces libraries and programs for handling multimedia data.
This module provides the ability to manage the installation of FFmpeg using puppet.

## Setup

### Requirements

* [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)
* [puppetlabs-yumrepo_core](https://forge.puppet.com/modules/puppetlabs/yumrepo_core)
* [puppet-epel](https://forge.puppetlabs.com/stahnma/epel)

### Getting Started

#### r10k / librarian-puppet

Add the following snippet to your `Puppetfile`.
```
mod 'jarodiv-ffmpeg'
  :git => https://github.com/jarodiv/puppet-ffmpeg.git
```

## Usage

Include the main class to get started with the default options:

```puppet
include 'ffmpeg'
```

If you want to additionally install the development libraries:

```puppet
class { 'ffmpeg':
  include_devel  => true,
}
```

This module also supports Hiera:

```yaml
ffmpeg::include_devel: true
```

## Reference

### Classes

#### Public Classes

##### Class: `ffmpeg`

Manages the installation of FFmpeg.

`include_devel`
Optional: Whether the Development package for ffmpeg or not. Default: `false`

## Limitations

This module currently only supports CentOS 7 and 8.

## Development

Pull requests are always welcome.
