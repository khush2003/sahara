export type DonationItem =  {
    name: string,
    description: string,
    donationId: number,
    category: string,
    imageUrl: string,
    useability: number,
    price: number,
    itemWidth: number,
    itemHeight: number,
    itemLength: number,
    weight: number,
    estimatedItemValue: number,
    tags: string[],
    deliveryFees: number,
    deliveryPaidBy: string,
    donorName: string,
    usedDuration: TimeRanges, //Change type
    isGiven: boolean,
    authorId: number,
    authorName: string,
    authorImageURL: string,
    expectedArrivalDate: Date | null,
    pickUpDate: Date | null,
}

export type ItemReview = {
    reviewId: string,
    reviewerId: string,
    donationId: string,
    reviewText: string,
    reviewerName: string,
    reviewerImageURL: string,
    donationItemId: string,
}

export type User = {
    userId: string,
    name: string,
    userEmail: string,
    userImageURL: string,
    address: string,
    phone: string,
    userReviews: ItemReview[],
    userDonations: DonationItem[],
    userDonationsReceived: DonationItem[],
}