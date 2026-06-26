#!/bin/zsh

cd -- "$(dirname -- "$0")"

swift generateSFSymbolEnum.swift > Sources/SFSymbolEnum/SFSymbolEnum.generated.swift 
swift generateSFSymbolEnum.swift --extension > Sources/SFSymbolEnum/SFSymbolEnumExtension.generated.swift 
