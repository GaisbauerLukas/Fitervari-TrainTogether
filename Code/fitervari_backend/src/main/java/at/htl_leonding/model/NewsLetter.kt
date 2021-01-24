package at.htl_leonding.model

import javax.persistence.*

@Entity
@Table(name = "news_letter")
class NewsLetter(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    @Column(name = "title")
    var title: String,
    @Column(name = "body")
    var body: String,
    @Column(name = "imageUrl")
    var imageUrl: String

) {
    fun copyValues(other: NewsLetter) {
        this.title = other.title
        this.body = other.body
        this.imageUrl = other.imageUrl
    }
}