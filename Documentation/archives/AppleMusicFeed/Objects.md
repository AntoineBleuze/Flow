# Objects.pdf

## Page 1

albumType
string
The type of the album. The possible values are standard, single, deluxe
compilation, and ep.
artistRoles
[Album.ArtistRole]
(Required) A list of artists and their roles.
artworks
Album.Artworks
(Required) A mapping of locale to localized album cover art.
contentProvider
string
The name of the company that provides the album. Don’t use this name for
display purposes. This name doesn’t display in Apple Music.
contentTraits
[string]
(Required) A list of the content traits for the album. The possible values are
remix, live, compilation, and karaoke.
copyright
string
The copyright notice text.
copyrightPline
string
The copyright performance rights text that displays in Apple Music.
featuredArtists
[Album.Related
Artist]
(Required) A list of featured artists for the album.
Properties
Apple Music Feed / Album
Object
Album
The data structure that represents an Album resource.
AppleMusicFeed 1.0+


## Page 2

genres
[Album.Genre]
(Required) A list of genre information for the album.
id
string
The identifier for the album in Apple Music.
lastModifiedTime
string
The time, in ISO 8601 format, of the entity’s most recent update.
name
Album.Name
(Required) A mapping of locale to localized uncensored names for the album
nameDefault
string
The default name for the album.
namePronunciation
Album.Name
Pronunciation
(Required) A mapping of locale to translations for the specific pronunciation-
name translation type.
parentalAdvisoryType
string
The type of parental advisory status. The possible values are none,
explicit, not explicit, and cleaned.
prices
Album.Prices
(Required) A mapping of locale to pricing information. Pricing offer paramete
include price, priceType, and quality.
primaryArtists
[Album.Related
Artist]
(Required) A list of the primary artists of the album.
recordLabels
[Album.RecordLabel]
(Required) A list of record labels for the album.
releaseDate
Album.ReleaseDate
(Required) A mapping of locale to release date, in YYYY-MM-DD format.
songs
[Album.RelatedSong]
(Required) A list of songs in the album.
titleVersion
Album.TitleVersion
(Required) A mapping of locale to translations for the specific title-version
translation type.
titleVersion
Pronunciation
Album.TitleVersion
Pronunciation
(Required) A mapping of locale to translations for the specific title-version-
pronunciation-name translation type.


## Page 3

upc
string
The Universal Product Code or European Article Number for a piece of conte
from the provider.
urlTemplate
string
A template for the URL to view the entity in Apple Music. The template requir
an ISO country code for the {country-code} placeholder.
Possible types:
object Album.ArtistRole
Information about an artist’s role.
object Album.Artworks
A mapping of locale to localized album cover art.
object Album.Genre
A genre name and its structure.
object Album.Name
A mapping of locale to localized names for the album.
object Album.NamePronunciation
A mapping of locale to translations for the specific pronunciation-name translation type.
object Album.Prices
A mapping of locale to pricing information.
object Album.RecordLabel
Information about a record label.
object Album.RelatedArtist
Information about a related artist.
object Album.RelatedSong
Information about a related song.
object Album.ReleaseDate
Attributes
Topics
Related objects


## Page 4

A mapping of locale to release date for the album.
object Album.TitleVersion
A mapping of locale to translations for the specific title-version translation type.
object Album.TitleVersionPronunciation
A mapping of locale to translations for the specific title-version-pronunciation-name
translation type.
object Song
The data structure that represents a Song resource.
object Artist
The data structure that represents an Artist resource.
object PopularityTopChartAlbums
The data structure that represents an album popularity chart resource.
object PopularityTopChartSongs
The data structure that represents a song popularity chart resource.
See Also
Objects


## Page 5

album
[Song.RelatedAlbum]
A list of albums that contain the song.
artistRoles
[Song.ArtistRole]
(Required) A list of artists and their roles.
audioLocale
string
The locale of the audio. This usually corresponds to the language of the song
The locale uses the IETF language tag format.
contentTraits
[string]
(Required) A list of the content traits for the song. The possible values are
remix, live, compilation, and karaoke.
copyright
string
The copyright notice text.
copyrightPline
string
The copyright performance rights text that displays in Apple Music.
durationInMillis
number
The length of the song in milliseconds.
featuredArtists
[Song.RelatedArtist]
(Required) A list of the featured artists of the song.
Properties
Apple Music Feed / Song
Object
Song
The data structure that represents a Song resource.
AppleMusicFeed 1.0+


## Page 6

genres
[Song.Genre]
(Required) A list of genre information for the song.
id
string
The identifier for the song in Apple Music.
isrc
string
The International Standard Recording Code (ISRC) for the sound or music vid
recording.
lastModifiedTime
string
The time, in ISO 8601 format, of the entity’s most recent update.
name
Song.Name
(Required) A mapping of locale to localized uncensored names for the song.
nameDefault
string
The default name for the song.
namePronunciation
Song.Name
Pronunciation
(Required) A mapping of locale to translations for the specific pronunciation-
name translation type.
parentalAdvisoryType
string
The type of parental advisory status. The possible values are none,
explicit, not explicit, and cleaned.
prices
Song.Prices
(Required) A mapping of locale to pricing information. Pricing offer paramete
include price, priceType, and quality.
primaryArtists
[Song.RelatedArtist]
(Required) A list of the primary artists of the song.
releaseDate
Song.ReleaseDate
(Required) A mapping of locale to release date, in YYYY-MM-DD format.
shortPreview
string
(Required) A template for the URL for a short audio preview of the song.
titleVersion
Song.TitleVersion
(Required) A mapping of locale to translations for the specific title-version
translation type.
titleVersion
Pronunciation
Song.TitleVersion
Pronunciation
(Required) A mapping of locale to translations for the specific title-version-
pronunciation-name translation type.
trackNumber
The track number of the song.


## Page 7

number
urlTemplate
string
A template for the URL to view the entity in Apple Music. The template requir
an ISO country code for the {country-code} placeholder.
volumeNumber
number
The volume number of the song.
Possible types:
object Song.ArtistRole
Information about an artist’s role.
object Song.Genre
A genre name and its structure.
object Song.Name
A mapping of locale to localized names for the song.
object Song.NamePronunciation
A mapping of locale to translations for the specific pronunciation-name translation type.
object Song.Prices
A mapping of locale to pricing information.
object Song.RelatedAlbum
Information about a related album.
object Song.RelatedArtist
Information about a related artist.
object Song.ReleaseDate
A mapping of locale to release date for the song.
object Song.TitleVersion
A mapping of locale to translations for the specific title-version translation type.
Attributes
Topics
Related objects


## Page 8

object Song.TitleVersionPronunciation
A mapping of locale to translations for the specific title-version-pronunciation-name
translation type.
object Album
The data structure that represents an Album resource.
object Artist
The data structure that represents an Artist resource.
object PopularityTopChartAlbums
The data structure that represents an album popularity chart resource.
object PopularityTopChartSongs
The data structure that represents a song popularity chart resource.
See Also
Objects


## Page 9

artistType
string
The artist type for the artist. The possible values are artist, tv-show,
studio, podcast-artist, author, movie-artist, software-artis
itunes-u-artist, and trainer.
id
string
The identifier for the artist in Apple Music.
lastModifiedTime
string
The time, in ISO 8601 format, of the entity’s most recent update.
name
Artist.Name
(Required) A mapping of locale to localized uncensored names for the artist.
nameDefault
string
The default name for the artist.
namePronunciation
Artist.Name
Pronunciation
(Required) A mapping of locale to translations for the specific pronunciation-
name translation type.
urlTemplate
string
A template for the URL to view the entity in Apple Music. The template requir
an ISO country code for the {country-code} placeholder.
Properties
Apple Music Feed / Artist
Object
Artist
The data structure that represents an Artist resource.
AppleMusicFeed 1.0+


## Page 10

Possible types:
object Artist.Name
A mapping of locale to localized names for the artist.
object Artist.NamePronunciation
A mapping of locale to translations for the specific pronunciation-name translation type.
object Album
The data structure that represents an Album resource.
object Song
The data structure that represents a Song resource.
object PopularityTopChartAlbums
The data structure that represents an album popularity chart resource.
object PopularityTopChartSongs
The data structure that represents a song popularity chart resource.
Attributes
Topics
Related objects
See Also
Objects


## Page 11

genre
PopularityTopChart
Albums.Genre
(Required) The chart’s associated genre.
rankings
[PopularityTopChart
Albums.Rankings]
(Required) A list of album rankings in the chart.
storefront
string
(Required) The chart’s associated storefront.
Possible types:
object PopularityTopChartAlbums.Genre
Properties
Attributes
Topics
Related objects
Apple Music Feed / PopularityTopChartAlbums
Object
PopularityTopChartAlbums
The data structure that represents an album popularity chart resource.
AppleMusicFeed 1.0+


## Page 12

A genre name and its structure.
object PopularityTopChartAlbums.Rankings
An album’s ranking in a popularity chart.
object Album
The data structure that represents an Album resource.
object Song
The data structure that represents a Song resource.
object Artist
The data structure that represents an Artist resource.
object PopularityTopChartSongs
The data structure that represents a song popularity chart resource.
See Also
Objects


## Page 13

genre
PopularityTopChart
Songs.Genre
(Required) The chart’s associated genre.
rankings
[PopularityTopChart
Songs.Rankings]
(Required) A list of song rankings in the chart.
storefront
string
(Required) The chart’s associated storefront.
Possible types:
object PopularityTopChartSongs.Genre
Properties
Attributes
Topics
Related objects
Apple Music Feed / PopularityTopChartSongs
Object
PopularityTopChartSongs
The data structure that represents a song popularity chart resource.
AppleMusicFeed 1.0+


## Page 14

A genre name and its structure.
object PopularityTopChartSongs.Rankings
A song’s ranking in a popularity chart.
object Album
The data structure that represents an Album resource.
object Song
The data structure that represents a Song resource.
object Artist
The data structure that represents an Artist resource.
object PopularityTopChartAlbums
The data structure that represents an album popularity chart resource.
See Also
Objects


