
(defparameter *piano-css*
  "
.container {
    background-image: linear-gradient(90deg, #9331d4, rgb(239 5 92 / 70%));
    height: 100vh;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.intro-container {
    color: #fff;
    text-align: center;
}

.piano-container {
    display: flex;
    align-items: center;
    justify-content: center;
}

.piano-keys-list {
    list-style: none;
    display: flex;
    justify-content: center;
}

.piano-keys {
    width: 5rem;
    cursor: pointer;
    position: relative;
    height: 20rem;
    border-radius: 10px;
    border: 1px solid #000;
}

.white-key {
    background-color: #fff;
}

.black-key {
    width: 2rem;
    height: 13rem;
    border-radius: 5px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-color: #000;
    z-index: 2;
    margin: 0 -20px 0 -20px;
}

@media screen and (min-width: 821px) and (max-width: 1024px) {
    .piano-keys {
        width: 4rem;
        cursor: pointer;
        position: relative;
        height: 20rem;
        border-radius: 10px;
        border: 1px solid #000;
    }

    .black-key {
        width: 2rem;
        height: 13rem;
        border-radius: 5px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        background-color: #000;
        z-index: 2;
        margin: 0 -20px 0 -20px;
    }
}

@media screen and (min-width: 768px) and (max-width: 820px) {
    .piano-keys {
        width: 3.5rem;
        cursor: pointer;
        position: relative;
        height: 16rem;
        border-radius: 10px;
        border: 1px solid #000;
    }

    .black-key {
        width: 1.8rem;
        height: 10rem;
        border-radius: 5px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        background-color: #000;
        z-index: 2;
        margin: 0 -20px 0 -20px;
    }
}

@media screen and (max-width: 576px) {
    .piano-container {
        width: 90%;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        overflow: auto;
    }

    .piano-keys {
        width: 3.5rem;
        cursor: pointer;
        position: relative;
        height: 16rem;
        border-radius: 10px;
        border: 1px solid #000;
    }

    .black-key {
        width: 1.8rem;
        height: 10rem;
        border-radius: 5px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        background-color: #000;
        z-index: 2;
        margin: 0 -20px 0 -20px;
    }
}
")
